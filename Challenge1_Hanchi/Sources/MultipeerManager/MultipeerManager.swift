//
//  MultipeerManager.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 4/20/26.
//

import Foundation
import MultipeerConnectivity
import SwiftData

extension MCPeerID {
    // 내 기기의 존재 자체를 상대 기기에 각인 시키기
    static func fetchOrCreate(displayName: String) -> MCPeerID {
        let key = "my_peer_id"
        
        if let data = UserDefaults.standard.data(forKey: key),
           let peerID = try? NSKeyedUnarchiver.unarchivedObject(ofClass: MCPeerID.self, from: data) {
            print("기존 PeerID: \(peerID.displayName)")
            return peerID
        } else {
            let newPeerID = MCPeerID(displayName: displayName)
            
            if let data = try? NSKeyedArchiver.archivedData(withRootObject: newPeerID, requiringSecureCoding: true) {
                UserDefaults.standard.set(data, forKey: key)
                print("새로운 PeerID: \(displayName)")
            }
            return newPeerID
        }
    }
}

@Observable
class MultipeerManager: NSObject, MCNearbyServiceBrowserDelegate {
    private let serviceType = "hanchi-app"
    
    private let myPeerID: MCPeerID
    private let advertiser: MCNearbyServiceAdvertiser
    
    private let serviceBrowser: MCNearbyServiceBrowser
    
    var discoveredCreatures: [OtherCreature] = []
    
    // SwiftData의 MyCreature에서 가져온 정보
    private var myId: String
    private var myName: String

    init(myProfile: MyCreature) {
        let id = myProfile.id.uuidString
        let name = myProfile.creature.name
        
        self.myId = id
        self.myName = name
        
        let peerID = MCPeerID.fetchOrCreate(displayName: name)
        self.myPeerID = peerID
        
        // 내 기기의 UUID를 Discovery Info에 담음
        let discoveryInfo: [String: String] = ["id": id, "name": name, "icon": myProfile.creature.iconName]
        
        self.advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: discoveryInfo, serviceType: serviceType)
        
        self.serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        
        super.init()
        
        self.advertiser.delegate = self
        self.advertiser.startAdvertisingPeer()
        
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
        
        print("내 위치 알리기? (ID: \(id), Name: \(name))")
    }
}

// Advertiser의 상태를 알려주는 델리게이트
extension MultipeerManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(false, nil)
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        print("신호 뿌리기 실패: \(error.localizedDescription)")
    }
    
    // 기기를 발견했을 때 호출되는 함수
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("새로운 생물 발견: \(peerID.displayName)")
        
        // 상대방이 보낸 info에서 ID를 꺼냄
        if let idString = info?["id"], let uuid = UUID(uuidString: idString) {
            if !discoveredCreatures.contains(where: { $0.id == uuid }) {
                let newFriend = OtherCreature(
                    id: uuid,
                    creature: Creature(name: peerID.displayName, iconName: "bokeo")
                )
                
                DispatchQueue.main.async {
                    self.discoveredCreatures.removeAll() // 배열의 모든 내용 삭제
                    self.discoveredCreatures.append(newFriend) // 새 친구 추가
                }
            }
        }
    }

    // 기기가 멀어졌을 때
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("생물이 멀어짐: \(peerID.displayName)")
    }
}
