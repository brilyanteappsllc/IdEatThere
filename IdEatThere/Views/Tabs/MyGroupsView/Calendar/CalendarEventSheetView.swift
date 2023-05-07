//
//  CalendarEventSheetView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/7/23.
//

import SwiftUI

struct CalendarEventSheetView: View {
    
    @EnvironmentObject var eventStore : CalendarEventStoreViewModel
    @Binding var dateSelected: DateComponents?
    
    var body: some View {
            
        Group {
            if let dateSelected {
                let foundEvents = eventStore.calendarEvents.filter { $0.date?.startOfDay == dateSelected.date!.startOfDay }
                
                List {
                    ForEach(foundEvents) { event in
                        
                        CalendarEventListRowView(eventStore: eventStore, event: event)
                        
                        
                    }
                }
            }
        }
        
        
    }
}

//struct CalendarEventSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarEventSheetView()
//    }
//}
