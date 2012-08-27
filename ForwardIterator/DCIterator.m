//
//  DCIterator.m
//  ForwardIterator
//
//  Created by Dalmo Cirne on 8/27/12.
//  Copyright (c) 2012 Dalmo Cirne. All rights reserved.
//
/*
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "DCIterator.h"

@interface DCIterator() {
    size_t index;
    long numberOfItems;
    void *items;
    size_t sizeOfItem;
}

@end

@implementation DCIterator

- (id)initWithDelegate:(id<DCIteratorDelegate>)delegate {
    self = [super init];
    if (self) {
        index = 0;
        self.delegate = delegate;
    }
    
    return self;
}

#pragma mark Accessors
- (void)setDelegate:(id<DCIteratorDelegate>)delegate {
    _delegate = delegate;
    numberOfItems = [_delegate numberOfItems];
    items = [_delegate items];
    sizeOfItem = [_delegate sizeOfItem];
}

#pragma mark Public methods
- (BOOL)hasNext {
    return ((numberOfItems > 0) && (index < numberOfItems));
}

- (void *)next {
    void *nextItem = &items[index++ * sizeOfItem];
    
    return nextItem;
}

@end
