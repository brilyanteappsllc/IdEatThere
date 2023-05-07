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
        view.delegate = context.coordinator
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
            
            // Determine if there are found events from query
            let foundEvents = eventStore.calendarEvents
                // compare iterated event dates from firebase to calendar
                .filter {
                    $0.date?.startOfDay == dateComponents.date?.startOfDay
                }
            
            
            if foundEvents.isEmpty {return nil}
            
            // If multiple dates on a single data is found
            if foundEvents.count > 1 {
                return .image(UIImage(systemName: "doc.on.doc.fill"),
                              color: .red,
                              size: .large
                )
                
            }
            // Else return icon emoji
            let singleEvent = foundEvents.first!
            
            
            return .customView {
                let icon = UILabel()
                icon.text = self.eventStore.eventIcon(groupType: CalendarEventType(rawValue: singleEvent.groupType!) ?? .unspecified)
                icon.lineBreakMode = .byCharWrapping
                return icon
            }
            
        }
        
    }
    
}


