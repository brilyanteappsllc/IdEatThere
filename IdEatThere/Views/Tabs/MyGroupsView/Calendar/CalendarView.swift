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
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        view.tintColor = UIColor(Color.theme.secondaryText)
        view.fontDesign = .rounded
   //     view.fontDesign = foregroundColor(Color.theme.secondaryText)
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, eventSore: _eventStore)
    }
    
  
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
        uiView.calendar = Calendar(identifier: .gregorian)
        uiView.availableDateRange = interval
        
    }
    
    class Coordinator : NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        
        
        
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
            
                return icon
            }
            
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            
            parent.dateSelected = dateComponents
            
            guard let dateComponents else { return }
            
            let foundEvents = eventStore.calendarEvents
                .filter{
                    $0.date?.startOfDay == dateComponents.date?.startOfDay
                }
            
            if !foundEvents.isEmpty {
                parent.displayEvents.toggle()
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
        
    }
    
}


