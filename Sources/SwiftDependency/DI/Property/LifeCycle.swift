//
//  LifeCycle.swift
//  Vodafone LEAN
//
//  Created by Francesco Stabile on 30/01/25.
//  Copyright © 2025 NTT DATA. All rights reserved.
//


public enum LifeCycle {
    case singleton
    case scoped(Context)
    case transient
}
