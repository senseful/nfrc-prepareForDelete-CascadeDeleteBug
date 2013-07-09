#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// uncomment 0 or 1 of the following:
//#define Workaround_A
//#define Workaround_B
//#define Workaround_C

// when 0 are uncommented, the bug will occur
// when 1 of these are uncommented, a specific workaround for the bug will be implemented

@class EventParent;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSNumber * hasMovedUp;
@property (nonatomic, retain) EventParent *parent;

@end
