import AppKit

import SwiftUI


@main
struct StandUpApp: App {


    @StateObject private var settings: SettingsManager


    @StateObject private var timerManager: TimerManager





    init() {

        NSWindow.allowsAutomaticWindowTabbing = false


        let settingsManager =
            SettingsManager()

        _settings =
            StateObject(
                wrappedValue: settingsManager
            )


        _timerManager =
            StateObject(
                wrappedValue:
                    TimerManager(
                        settings:
                            settingsManager
                    )
            )


        NotificationManager.shared.requestPermission()

    }






    var body: some Scene {


        MenuBarExtra(
            "StandUp",
            systemImage: iconName
        ) {



            MenuBarView()

                .environmentObject(
                    timerManager
                )

                .environmentObject(
                    settings
                )


        }
        .menuBarExtraStyle(.window)






        Window(
            "StandUp 设置",
            id: "settings"
        ) {



            SettingsView(
                settings: settings
            )


        }
        .defaultSize(
            width: 300,
            height: 220
        )
        .windowResizability(.contentSize)
        

    }







    private var iconName: String {


        switch timerManager.state {


        case .stopped:

            return "circle"



        case .working:

            return "chair"



        case .standing:

            return "figure.stand"


        }


    }


}
