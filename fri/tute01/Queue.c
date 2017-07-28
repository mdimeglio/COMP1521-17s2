#include "Queue.h"
#include <stdlib.h>
#include <assert.h>
#define MAXQ 6
 
struct queue {
   int nitems;
   int head;
   int tail;
   int items[MAXQ];
};

// create a new empty Queue
Queue makeQueue() {
	Queue q = malloc(sizof struct queue);
	q->nitems = 0;
	q->head = 0;
	q->tail = 0;
	return q;
}

// delete memory associated with a Queue
void  freeQueue(Queue q) {
	free(q);
}

// insert a new item at the tail of the Queue
void  enterQueue(Queue q, int item) {
	assert(q->nitems < MAXQ);
	q->items[q->tail] = item;
	q->tail = (q->tail + 1)%MAXQ;
	q->nitems++;
}

// remove/return the item at the head of the Queue
int   leaveQueue(Queue q) {
	assert(q->nitems > 0);
	int toReturn = q->items[q->head];
	q->head = (q->head + 1)%MAXQ;
	q->nitems--;
	return toReturn;
}

// return the number of items currently in the Queue
int   lengthQueue(Queue q) {
	return q->nitems;
}

/*// create a new empty Queue
Queue makeQueue() {
	Queue q = malloc(sizeof(struct queue));
	q->nitems = 0;
	q->head = 0;
	q->tail = 0;
	return q;
}

// delete memory associated with a Queue
void  freeQueue(Queue q) {
	free(q);
}

// insert a new item at the tail of the Queue
void  enterQueue(Queue q, int item) {
	assert(q->nitems < MAXQ);
	q->nitems++;
	q->items[q->tail] = item;
	q->tail = (q->tail + 1) % MAXQ;
}

// remove/return the item at the head of the Queue
int   leaveQueue(Queue q) {
	assert(q->nitems > 0);
	q->nitems--;
	int toReturn = q->items[q->head];
	q->head = (q->head + 1)% MAXQ;
	return toReturn;
}

// return the number of items currently in the Queue
int   lengthQueue(Queue q) {
	return q->nitems;
}*/