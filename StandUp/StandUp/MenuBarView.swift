import AppKit

import SwiftUI



struct MenuBarView: View {



    @EnvironmentObject var timerManager: TimerManager

    @EnvironmentObject var settings: SettingsManager

    @Environment(\.openWindow)
    private var openWindow

    @Environment(\.dismiss)
    private var dismiss





    var body: some View {



        VStack(spacing: 10) {



            // MARK: - 标题

            HStack(spacing: 6) {


                Image(systemName: "timer")


                Text("StandUp")
                    .font(.headline)


            }







            Divider()







            // MARK: - 状态

            HStack(spacing: 6) {


                Image(systemName: statusIcon)


                Text(statusText)


            }
            .font(.system(size: 14))







            // MARK: - 倒计时

            TimelineView(
                .periodic(
                    from: .now,
                    by: 1
                )
            ) { context in


                Text(
                    timeText(
                        at: context.date
                    )
                )
                .font(
                    .system(
                        size: 22,
                        weight: .medium
                    )
                )


            }







            Divider()







            Button {

                timerManager.start()

                DispatchQueue.main.async {
                    NSApp.keyWindow?.close()
                }

            } label: {

                Label(
                    "开始计时",
                    systemImage: "play.fill"
                )

            }
            .disabled(
                timerManager.state != .stopped
            )








            Button {

                timerManager.stop()

                DispatchQueue.main.async {
                    NSApp.keyWindow?.close()
                }

            } label: {

                Label(
                    "停止计时",
                    systemImage: "stop.fill"
                )

            }
            .disabled(
                timerManager.state == .stopped
            )








            Button {

                openWindow(
                    id: "settings"
                )


                DispatchQueue.main.async {

                    NSApp.activate(
                        ignoringOtherApps: true
                    )


                    NSApp.windows
                        .first(where: {
                            $0.title == "StandUp 设置"
                        })?
                        .makeKeyAndOrderFront(nil)

                }


            } label: {

                Label(
                    "设置",
                    systemImage: "gearshape"
                )

            }








            Divider()







            Button {


                NSApplication.shared.terminate(nil)


            } label: {


                Label(
                    "退出",
                    systemImage: "power"
                )


            }



        }

        .padding(.vertical, 6)

        .padding(.horizontal, 2)

        .frame(width: 170)



    }









    // MARK: - 状态文字

    private var statusText: String {



        switch timerManager.state {



        case .stopped:


            return "状态：未开始"




        case .working:


            return "工作中"




        case .standing:


            return "站立中"



        }


    }








    // MARK: - 状态图标

    private var statusIcon: String {



        switch timerManager.state {



        case .stopped:


            return "pause.circle"




        case .working:


            return "chair.lounge.fill"




        case .standing:


            return "figure.stand"



        }


    }









    // MARK: - 倒计时

    private func timeText(at date: Date) -> String {



        if timerManager.state == .stopped {


            return "剩余 --:--"


        }






        guard let endDate =
                timerManager.endDate else {


            return "剩余 --:--"


        }




        let remainingSeconds =
            max(
                0,
                Int(
                    ceil(
                        endDate.timeIntervalSince(date)
                    )
                )
            )




        let minutes =
            remainingSeconds / 60




        let seconds =
            remainingSeconds % 60






        return String(
            format: "剩余 %02d:%02d",
            minutes,
            seconds
        )



    }



}
