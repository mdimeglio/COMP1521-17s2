#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

typedef struct _node {
   int  value;
   struct _node *next;
} Node;

Node *newNode(int v);
Node *newList(int items[], int size);
Node *emptyList();
Node *push(Node *l, int item);
int pop(Node **l);
void freeList(Node *l);

int sumList(Node *L) {
	//TO DO
	return 0;
}

Node *append(Node *L, int v) {
	//TO DO
	return L;
}

void testSum() {
	Node *l;

	l = emptyList();
	assert(sumList(l) == 0);
	freeList(l);


	int a1[] = {1};
	l = newList(a1, 1);
	assert(sumList(l) == 1);
	freeList(l);

	int a2[] = {1, 2, 3};
	l = newList(a2, 3);
	assert(sumList(l) == 6);
	freeList(l);
}

void testAppend() {
	Node *l;

	l = emptyList();
	l = append(l, 5);
	l = append(l, 7);
	assert(pop(&l) == 5);
	assert(pop(&l) == 7);
	freeList(l);
}

int main() {
	testSum();
	testAppend();
	printf("All tests passed!\n");
	return 0;
}


Node *newNode(int v) {
   Node *new;
   new = malloc(sizeof(Node));
   new->value = v;
   new->next = NULL;
   return new;
}

Node *newList(int items[], int size) {
	Node *l = emptyList();
	for (int i = 0; i < size; i++) {
		l = push(l, items[size - i - 1]);
	}
	return l;
}

void freeList(Node *l) {
	while (l != NULL) {
		pop(&l);
	}
}

Node *emptyList() {
	return NULL;
}

int pop(Node **l) {
	assert(l != NULL);
	assert(*l != NULL); //Cannot pop from empty list
	Node *front = *l;
	*l = front->next;
	int toReturn = front->value;
	free(front);
	return toReturn;
}

Node *push(Node *l, int item) {
	Node *front = newNode(item);
	front->next = l;
	return front;
}