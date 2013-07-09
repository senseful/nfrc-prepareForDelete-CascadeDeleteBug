#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EventParent;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSNumber * hasMovedUp;
@property (nonatomic, retain) EventParent *parent;

@end
