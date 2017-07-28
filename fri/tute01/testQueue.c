#include <stdio.h>
#include <assert.h>
#include "Queue.h"

void test1() {
	Queue q = makeQueue();
	assert(lengthQueue(q) == 0);
	enterQueue(q, 1);
	assert(lengthQueue(q) == 1);
	assert(leaveQueue(q) == 1);
	assert(lengthQueue(q) == 0);
	freeQueue(q);
}

void test2() {
	Queue q = makeQueue();
	enterQueue(q, 1);
	enterQueue(q, 2);
	enterQueue(q, 3);
	assert(lengthQueue(q) == 3);
	assert(leaveQueue(q) == 1);
	assert(leaveQueue(q) == 2);
	assert(leaveQueue(q) == 3);
	assert(lengthQueue(q) == 0);
	freeQueue(q);
}

void test3() {
	Queue q = makeQueue();
	enterQueue(q, 1);
	enterQueue(q, 4);
	enterQueue(q, 5);
	enterQueue(q, 7);
	assert(leaveQueue(q) == 1);
	assert(leaveQueue(q) == 4);
	enterQueue(q, 6);
	enterQueue(q, 9);
	assert(leaveQueue(q) == 5);
	enterQueue(q, 2);
	assert(leaveQueue(q) == 7);
	assert(leaveQueue(q) == 6);
	assert(leaveQueue(q) == 9);
	assert(leaveQueue(q) == 2);
	assert(lengthQueue(q) == 0);
	freeQueue(q);
}

int main() {
	test1();
	test2();
	test3();
	printf("All tests passed!\n");
	return 0;
}

