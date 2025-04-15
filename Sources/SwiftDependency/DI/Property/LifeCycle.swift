//
//  LifeCycle.swift
//  SwiftDependency
//
//  Created by Francesco Stabile on 15/04/25.
//


public enum LifeCycle {
    case singleton
    case scoped(Context)
    case transient
}
