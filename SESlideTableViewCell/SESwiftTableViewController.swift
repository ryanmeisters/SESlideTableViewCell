//
//  SESwiftTableViewController.swift
//  slidetableviewcell
//
//  Created by letdown on 2014/07/15.
//  Copyright (c) 2014 Space Elephant. All rights reserved.
//

import UIKit

class SESwiftTableViewController: UITableViewController, SESlideTableViewCellDelegate {
	
	var collation: UILocalizedIndexedCollation?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let button = UIBarButtonItem(title: "Index", style: .Plain, target:self, action: "indexButtonDidTap:")
		navigationItem.rightBarButtonItem = button
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
		if collation {
			return collation!.sectionIndexTitles.count
		} else {
			return 1
		}

	}

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return 7
	}
	
	override func tableView(tableView: UITableView!, sectionForSectionIndexTitle title: String!, atIndex index: Int) -> Int {
		if collation {
			return collation!.sectionForSectionIndexTitleAtIndex(index)
		}
		return index
	}
	
	override func sectionIndexTitlesForTableView(tableView: UITableView!) -> [AnyObject]! {
		return collation?.sectionIndexTitles
	}
	
	override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
		if collation {
			return collation!.sectionTitles[section] as? String
		}
		return nil
	}
	
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
		let CELL_ID = "Cell"
		var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? SESlideTableViewCell
		if !cell {
			cell = SESlideTableViewCell(style: .Default, reuseIdentifier: CELL_ID)
			cell!.selectionStyle = .None
			cell!.delegate = self
		}
		cell!.removeAllLeftButtons()
		cell!.removeAllRightButtons()
		
		cell!.textLabel.text = "Slide Cell for \(indexPath.section) - \(indexPath.row)"
		
		switch indexPath.row {
		case 0:
			cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addRightButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
		case 1:
			cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addRightButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.accessoryType = .DisclosureIndicator
		case 2:
			cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addRightButtonWithText("World with Love", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
		case 3:
			cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addRightButtonWithText("World", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addRightButtonWithText("Again", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 120.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
		case 4:
			cell!.addRightButtonWithImage(UIImage(named: "image-cloud"), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
		case 5:
			cell!.addLeftButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addLeftButtonWithText("World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.accessoryType = .DisclosureIndicator
		case 6:
			cell!.addRightButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addRightButtonWithText("Right World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addLeftButtonWithText("Hello", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 0.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
			cell!.addLeftButtonWithText("Left World!!", textColor: UIColor.whiteColor(), backgroundColor: UIColor(hue: 180.0/360.0, saturation: 0.8, brightness: 0.9, alpha: 1.0))
		default:
			break
		}
		
        return cell
    }

	override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
		let cell = tableView.cellForRowAtIndexPath(indexPath) as SESlideTableViewCell!
		switch cell.slideState {
		case .Center:
			cell.setSlideState(.Right, animated:true)
		default:
			cell.setSlideState(.Center, animated:true)
		}
	}

	// #pragma mark -
	
	func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerLeftButton buttonIndex: NSInteger) {
		let indexPath = tableView.indexPathForCell(cell)
		println("left button \(buttonIndex) tapped in cell \(indexPath.section) - \(indexPath.row)")
	}
	
	func slideTableViewCell(cell: SESlideTableViewCell!, didTriggerRightButton buttonIndex: NSInteger) {
		let indexPath = tableView.indexPathForCell(cell)
		println("right button \(buttonIndex) tapped in cell \(indexPath.section) - \(indexPath.row)")
	}
	
	func slideTableViewCell(cell: SESlideTableViewCell!, canSlideToState slideState: SESlideTableViewCellSlideState) -> Bool {
		let indexPath = tableView.indexPathForCell(cell)
		if indexPath.section == 1 && indexPath.row == 1 {
			return false
		}
		return true
	}
	
	// #pragma mark -
	
	func indexButtonDidTap(sender: AnyObject!) {
		if collation {
			collation = nil
		} else {
			collation = UILocalizedIndexedCollation.currentCollation() as? UILocalizedIndexedCollation
		}
		tableView.reloadData()
	}

}
