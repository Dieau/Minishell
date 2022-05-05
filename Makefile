# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rbony <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/28 08:34:54 by rbony             #+#    #+#              #
#    Updated: 2022/05/04 14:29:25 by rbony            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME = minishell

SRCS = 	src/main.c \
		src/prompt.c 		\
		src/errors.c		\
		src/parsing/place_env_var.c \
		src/parsing/pre_checking.c  \
		src/builtins/env_utils.c \
		src/builtins/env.c \
		src/builtins/export.c	\
		src/builtins/export_utils.c	\
		src/builtins/sort_export.c	\
		src/builtins/unset.c \
		src/builtins/cd.c	\
		src/builtins/signals.c \
		src/parsing/manage_cmd.c \
		src/parsing/manage_heredoc.c \
		src/parsing/manage_redirect.c \
		src/parsing/ft_cmd_split.c

OBJS = ${SRCS:.c=.o}

HEADERS = minishell.h

CC = gcc -g -fsanitize=address
RM = rm -f

FLAGS = -Wall -Wextra -Werror

all: lib ${NAME}

$(NAME): ${OBJS}
	${CC} ${OBJS} -lreadline -I./readline/include -L./readline/lib -lncurses libft/libft.a -o ${NAME}

%.o : %.c ${HEADERS} Makefile
	${CC} ${FLAGS} -c $< -o ${<:.c=.o}

clean:
	${RM} ${OBJS}
	make clean -C libft

fclean:	clean
	${RM} ${NAME}
	make fclean -C libft

re:	fclean all

lib:
	make bonus -C libft

.PHONY: all clean fclean re 
