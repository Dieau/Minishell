/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rbony <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/04 13:21:05 by rbony             #+#    #+#             */
/*   Updated: 2021/11/04 17:14:19 by rbony            ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putnbr_fd(int nb, int fd)
{
	char	a;

	if (nb < 0)
	{
		write(fd, "-", 1);
		nb = nb * -1;
	}
	if (nb == -2147483648)
	{
		write(fd, "2147483648", 10);
	}
	else if (nb >= 10)
	{
		ft_putnbr_fd(nb / 10, fd);
		a = (nb % 10 + '0');
		write(fd, &a, 1);
	}
	else
	{
		a = (nb % 10 + '0');
		write(fd, &a, 1);
	}
}
