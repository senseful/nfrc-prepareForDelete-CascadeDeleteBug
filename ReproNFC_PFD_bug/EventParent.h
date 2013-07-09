#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface EventParent : NSManagedObject

@property (nonatomic, retain) Event *child;

@end
