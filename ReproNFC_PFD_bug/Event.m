#import "Event.h"
#import "EventParent.h"

BOOL kWorkaroundA = NO;
BOOL kWorkaroundB = NO;
BOOL kWorkaroundC = NO;

@implementation Event

@dynamic timeStamp;
@dynamic hasMovedUp;
@dynamic parent;

- (void)updateLastEventInContext:(NSManagedObjectContext *)context {
    // warning: do not call self.<anything> in this method when it is called with a delay, since the object would have already been deleted
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Event"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    NSArray *results = [context executeFetchRequest:fetchRequest error:nil];
    NSAssert(results, nil);
    Event *lastEvent = results.lastObject;
    NSLog(@"Updating event: %@", lastEvent.timeStamp);
    lastEvent.hasMovedUp = @YES;
}

- (void)prepareForDeletion {
    NSLog(@"Prepare for deletion");
    
    // (CUSTOMIZATION_POINT C)
    if (!kWorkaroundC) {
        [self updateLastEventInContext:self.managedObjectContext]; // C1: causes the bug
    } else {
        [self performSelector:@selector(updateLastEventInContext:) withObject:self.managedObjectContext afterDelay:0]; // C2: doesn't cause the bug
    }
	
    [super prepareForDeletion];
}

@end
