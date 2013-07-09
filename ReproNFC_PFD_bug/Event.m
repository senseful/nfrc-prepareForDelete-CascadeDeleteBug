#import "Event.h"
#import "EventParent.h"


@implementation Event

@dynamic timeStamp;
@dynamic hasMovedUp;
@dynamic parent;

- (void)prepareForDeletion {
    NSLog(@"Prepare for deletion");
	
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    NSAssert(results, nil);
    Event *lastEvent = results.lastObject;
    NSLog(@"Updating event: %@", lastEvent.timeStamp);
    lastEvent.hasMovedUp = @YES;
	
    [super prepareForDeletion];
}

@end
