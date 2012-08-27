//
//  DCSampleCode.m
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

#import "DCSampleCode.h"
#import "DCIterator.h"

typedef struct {
    int seconds;
    int minutes;
    int hours;
} TimeStruct;


@interface DCSampleCode() <DCIteratorDelegate> {
    TimeStruct *timeStruct;
    long numberOfEntries;
}

@end


@implementation DCSampleCode

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    numberOfEntries = 100;
    timeStruct = malloc(numberOfEntries * sizeof(TimeStruct));
    
    unsigned int randomSeed = (unsigned int)time(NULL);
    srand (randomSeed);

    TimeStruct *t;
    for (size_t i = 0; i < numberOfEntries; i++) {
        t = &timeStruct[i];
        t->seconds = rand() % 60;
        t->minutes = rand() % 60;
        t->hours = rand() % 24;
    }
    
    return self;
}

- (void)dealloc {
    free(timeStruct);
}

#pragma mark DCIteratorDelegate methods
- (long)numberOfItems {
    return numberOfEntries;
}

- (void *)items {
    return timeStruct;
}

- (size_t)sizeOfItem {
    return sizeof(TimeStruct);
}

#pragma mark Public methods
- (void)traverseTimeStructure {
    DCIterator *iterator = [[DCIterator alloc] initWithDelegate:self];
    TimeStruct *t;
    int index = 0;
    
    for (; [iterator hasNext];) {
        t = [iterator next];
        printf("%d - %02i:%02i:%02i\n", index++, t->hours, t->minutes, t->seconds);
    }
}

@end
