CC = gcc

DEBUG?=0

ifeq ($(DEBUG), 1)
  CFLAGS = -Iinclude -Wall -g -DDEBUG
else
  CFLAGS = -Iinclude -Wall -O2
endif

DEPFLAGS = -MMD -MP

inc_dir = include
dat_op = dataop
mat_op = mathop
str_op = stringop
src = src

mop_src = src/$(mat_op)/mathop.c src/$(mat_op)/main_math.c
sop_src = src/$(str_op)/stringop.c src/$(str_op)/main_string.c
dop_src = src/$(dat_op)/dataop.c src/$(dat_op)/main_data.c
aops_src = src/main.c src/$(mat_op)/mathop.c src/$(str_op)/stringop.c src/$(dat_op)/dataop.c

mop_obj = $(mop_src:.c=.o)
sop_obj = $(sop_src:.c=.o)
dop_obj = $(dop_src:.c=.o)
aops_obj = $(aops_src:.c=.o)

MATH_OPS = math_ops
STRING_OPS = string_ops
DATA_OPS = data_ops
ALL_OPS = all_ops

all: $(MATH_OPS) $(STRING_OPS) $(DATA_OPS) $(ALL_OPS)

$(MATH_OPS): $(mop_obj)
	$(CC) $(CFLAGS) $^ -o $@

$(STRING_OPS): $(sop_obj)
	$(CC) $(CFLAGS) $^ -o $@

$(DATA_OPS): $(dop_obj)
	$(CC) $(CFLAGS) $^ -o $@

$(ALL_OPS): $(aops_obj)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c $(wildcard $(INCLUDE_DIR)/*.h)
	$(CC) $(CFLAGS) $(DEPFLAGS) -I$(inc_dir) -c $< -o $@

-include $(mop_obj:.o=.d) $(sop_obj:.o=.d) $(dop_obj:.o=.d) $(aops_obj:.o=.d)

run_math: $(MATH_OPS)
	./$(MATH_OPS)

run_string: $(STRING_OPS)
	./$(STRING_OPS)

run_data: $(DATA_OPS)
	./$(DATA_OPS)

run_all_ops: $(ALL_OPS)
	./$(ALL_OPS)

clean:
	rm -f $(mop_obj) $(sop_obj) $(dop_obj) $(aops_obj) \
	       $(MATH_OPS) $(STRING_OPS) $(DATA_OPS) $(ALL_OPS) \
	       $(mop_obj:.o=.d) $(sop_obj:.o=.d) $(dop_obj:.o=.d) $(aops_obj:.o=.d)

.PHONY: run_math run_string run_data run_all_ops clean