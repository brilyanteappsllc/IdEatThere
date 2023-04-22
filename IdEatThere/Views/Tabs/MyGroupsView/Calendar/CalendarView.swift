//
//  CalendarView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 4/21/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct CalendarView: UIViewRepresentable {
    
    let interval: DateInterval
    
  //  @Binding var selectedDate : Date?
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
 //       view.selectionBehavior = UICalendarSelectionSingleDate(delegate: context.coordinator)
        return view
    }
    
//    func makeCoordinator() -> Coordinator {
//        <#code#>
//    }
//    
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
        uiView.calendar = Calendar(identifier: .gregorian)
        uiView.availableDateRange = interval
        
    }
    
//    class Coordinator: NSObject, UICalendarViewDelegate {
//
//        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//            return nil
//        }
//
//
//    }
    
}

//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}
