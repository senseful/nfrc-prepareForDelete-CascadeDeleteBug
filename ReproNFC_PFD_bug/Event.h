#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// set 0 or 1 of the following to YES:

extern BOOL kWorkaroundA;
extern BOOL kWorkaroundB;
extern BOOL kWorkaroundC;

// when 0 are set to YES, the bug will occur
// when 1 of these is set to YES, that specific workaround for the bug will be implemented
// Note: you can now customize the workaround used at run time by selecting the a value in the left bar button item

@class EventParent;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSNumber * hasMovedUp;
@property (nonatomic, retain) EventParent *parent;

@end
