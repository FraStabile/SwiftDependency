//
//  LifeCycle.swift
//
//  Created by Francesco Stabile on 30/01/25.
//


public enum LifeCycle {
    case singleton
    case scoped(Context)
    case transient
}
