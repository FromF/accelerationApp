//
//  AccelerationViewModel.swift
//  accelerationApp
//
//  Created by 藤治仁 on 2022/05/29.
//

import SwiftUI
import CoreMotion

class AccelerationViewModel: ObservableObject {
    @Published private(set) var acceX: Double = 0
    @Published private(set) var acceY: Double = 0
    @Published private(set) var acceZ: Double = 0
    @Published private(set) var isStarted = false

    private let motionManager = CMMotionManager()
    
    func start() {
        if motionManager.isAccelerometerAvailable {
            isStarted = true
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue()) { [weak self] motionData, _ in
                guard let self = self else { return }
                if let motionData = motionData {
                    self.acceX = motionData.acceleration.x
                    self.acceY = motionData.acceleration.y
                    self.acceZ = motionData.acceleration.z
                }
            }
        }
    }
    
    func stop() {
        if motionManager.isAccelerometerActive {
            isStarted = false
            motionManager.stopAccelerometerUpdates()
            acceX = 0
            acceY = 0
            acceZ = 0
        }
    }

}
