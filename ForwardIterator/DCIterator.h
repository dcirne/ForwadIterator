//
//  DCIterator.h
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

#import <Foundation/Foundation.h>

@protocol DCIteratorDelegate;

@interface DCIterator : NSObject

@property (nonatomic, weak) id<DCIteratorDelegate> delegate;

- (id)initWithDelegate:(id<DCIteratorDelegate>)delegate;
- (BOOL)hasNext;
- (void *)next;

@end

@protocol DCIteratorDelegate <NSObject>
- (long)numberOfItems;
- (void *)items;
- (size_t)sizeOfItem;
@end