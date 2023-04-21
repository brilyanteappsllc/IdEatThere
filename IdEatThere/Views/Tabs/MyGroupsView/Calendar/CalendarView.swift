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
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    
    
    

}

//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}
