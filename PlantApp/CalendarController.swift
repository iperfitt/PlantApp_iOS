//
//  CalendarController.swift
//  PlantApp
//
//  Created by Ian Perfitt on 12/19/17.
//  Copyright © 2017 Ian Perfitt. All rights reserved.
//
//import UIKit
//import JTAppleCalendar
//
//class CalendarController: UIViewController {
//
//    @IBOutlet weak var calendarView: JTAppleCalendarView!
//    @IBOutlet weak var year: UILabel!
//    @IBOutlet weak var month: UILabel!
//
//    //Make use of extension below to add colors by hex value
//    let outsideMonthColor = UIColor.black
//    let monthColor = UIColor.white
//    let selectedMonthColor = UIColor.green
//    let currentDateSelectedViewColor = UIColor.red
//
//
//    let formatter = DateFormatter()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCalendarView()
//    }
//
//    //Removes the cell inset
//    func setupCalendarView() {
//        calendarView.minimumLineSpacing = 0
//        calendarView.minimumInteritemSpacing = 0
//
//        //Setup labels
//        calendarView.visibleDates { (visibleDates) in
//            self.setupViewsOfCalendar(from: visibleDates)
//        }
//    }
//
//    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
//        let date = visibleDates.monthDates.first!.date
//
//        self.formatter.dateFormat = "yyyy"
//        self.year.text = self.formatter.string(from: date)
//
//        self.formatter.dateFormat = "MMMM"
//        self.month.text = self.formatter.string(from: date)
//    }
//
//    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
//        guard let validCell = view as? CustomCell else { return }
//
//        if cellState.isSelected {
//            validCell.dateLabel.textColor = selectedMonthColor
//        } else {
//            if cellState.dateBelongsTo == .thisMonth {
//                validCell.dateLabel.textColor = monthColor
//            } else {
//                validCell.dateLabel.textColor = outsideMonthColor
//            }
//        }
//    }
//
//    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
//        guard let validCell = view as? CustomCell else { return }
//        if validCell.isSelected {
//            validCell.selectedView.isHidden = false
//        } else {
//            validCell.selectedView.isHidden = true
//        }
//
//    }
//}
//
//extension CalendarController: JTAppleCalendarViewDataSource {
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        formatter.dateFormat = "yyyy MM dd"
//        formatter.timeZone = Calendar.current.timeZone
//        formatter.locale = Calendar.current.locale
//
//        let startDate = formatter.date(from: "2017 01 01")
//        let endDate = formatter.date(from: "2017 12 31")
//
//        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
//        return parameters
//    }
//}
//
//extension CalendarController: JTAppleCalendarViewDelegate {
//    //Display the cell
//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        cell.dateLabel.text = cellState.text
//
//        handleCellSelected(view: cell, cellState: cellState)
//        handleCellTextColor(view: cell, cellState: cellState)
//
//        return cell
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
//        handleCellSelected(view: cell, cellState: cellState)
//        handleCellTextColor(view: cell, cellState: cellState)
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
//        handleCellSelected(view: cell, cellState: cellState)
//        handleCellTextColor(view: cell, cellState: cellState)
//    }
//
//    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
//        setupViewsOfCalendar(from: visibleDates)
//    }
//}
//
////Used for choosing colors by hexagonal values
//extension UIColor {
//    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0) {
//        self.init(
//        red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
//        green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
//        blue: CGFloat(value & 0x0000FF) / 255.0,
//        alpha: alpha
//        )
//    }
//}

