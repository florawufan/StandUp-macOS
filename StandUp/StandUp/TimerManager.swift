import Foundation


enum StandUpState {
    case stopped
    case working
    case standing
}



class TimerManager: ObservableObject {


    // 当前状态

    @Published var state: StandUpState = .stopped



    // 剩余秒数（菜单显示备用）

    @Published var remainingSeconds: Int = 0



    // 当前阶段结束时间

    @Published private(set) var endDate: Date?



    private var timer: Timer?



    private var settings: SettingsManager



    init(settings: SettingsManager) {

        self.settings = settings

    }





    // MARK: - 开始计时

    func start() {


        state = .working


        startWorkTimer()


        startTimer()


    }





    // MARK: - 停止计时

    func stop() {


        timer?.invalidate()

        timer = nil



        state = .stopped


        remainingSeconds = 0


        endDate = nil


    }





    // MARK: - 工作阶段

    private func startWorkTimer() {


        let seconds =
        settings.workMinutes * 60



        endDate =
        Date().addingTimeInterval(
            TimeInterval(seconds)
        )


        remainingSeconds = seconds


    }





    // MARK: - 站立阶段

    private func startStandTimer() {


        let seconds =
        settings.standMinutes * 60



        endDate =
        Date().addingTimeInterval(
            TimeInterval(seconds)
        )


        remainingSeconds = seconds


    }






    // MARK: - Timer

    private func startTimer() {


        timer?.invalidate()



        let newTimer =
        Timer(
            timeInterval: 1,
            repeats: true
        ) { [weak self] _ in


            self?.updateRemainingTime()


        }



        timer = newTimer



        RunLoop.main.add(
            newTimer,
            forMode: .common
        )


    }






    // MARK: - 每秒更新

    private func updateRemainingTime() {


        guard let endDate else {

            return

        }



        let remaining =
        max(
            0,
            Int(
                ceil(
                    endDate.timeIntervalSinceNow
                )
            )
        )



        DispatchQueue.main.async {


            self.remainingSeconds = remaining



            if remaining <= 0 {


                self.switchPhase()

            }


        }


    }







    // MARK: - 工作/站立切换

    private func switchPhase() {



        switch state {



        case .working:


            NotificationManager.shared.send(
                title: "🧍 StandUp",
                message: "工作很久了，请站起来休息一下"
            )


            state = .standing


            startStandTimer()



        case .standing:


            NotificationManager.shared.send(
                title: "✅ StandUp",
                message: "休息完成，继续工作"
            )


            state = .working


            startWorkTimer()



        case .stopped:


            break


        }


    }


}
