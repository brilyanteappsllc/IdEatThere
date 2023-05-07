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
    
    @ObservedObject var eventStore : CalendarEventStoreViewModel
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, eventSore: _eventStore)
    }
    
  
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
        uiView.calendar = Calendar(identifier: .gregorian)
        uiView.availableDateRange = interval
        
    }
    
    class Coordinator : NSObject, UICalendarViewDelegate {
        
        
        var parent : CalendarView
        @ObservedObject var eventStore : CalendarEventStoreViewModel
        
        init(parent: CalendarView, eventSore: ObservedObject<CalendarEventStoreViewModel>) {
            self.parent = parent
            self._eventStore = eventSore
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
      //      let foundEvents = eventStore.
            return nil
        }
        
    }
    

    
}


