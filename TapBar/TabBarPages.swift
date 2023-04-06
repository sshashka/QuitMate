//
//  TabBarPages.swift
//  QuitMate
//
//  Created by Саша Василенко on 07.04.2023.
//

enum TabBarPages {
    case charts, home, setup
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .charts
        case 1:
            self = .home
        case 2:
            self = .setup
        default:
            return nil
        }
    }
    
    
}
