import React, { useState } from 'react';
import AppBar from '@material-ui/core/AppBar';
import CssBaseline from '@material-ui/core/CssBaseline';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import Link from '@material-ui/core/Link';
import Form from './form';
import { Button, ButtonBase, Dialog, DialogContent, DialogTitle, FormControlLabel, Grid, TextField } from '@material-ui/core';
import { useForm } from 'react-hook-form';
import axios from 'axios';

function Copyright() {
	return (
		<Typography variant="body2" color="textSecondary" align="center">
			{'Copyright © '}
			<Link color="inherit" href="https://www.linkedin.com/in/matthaeus-marinho-784b8b193/">
				Matthaeus Marinho
      		</Link>{' '}
			{new Date().getFullYear()}
			{'.'}
		</Typography>
	);
}

const useStyles = makeStyles((theme) => ({
	footer: {
		backgroundColor: theme.palette.background.paper,
		padding: theme.spacing(6),
	},
	root: {
		flexGrow: 1,
	},
	menuButton: {
		marginRight: theme.spacing(2),
	},
	title: {
		flexGrow: 1,
	},
}));

export default function Home() {
	const classes = useStyles();
	const [openDialog, setOpenDialog] = useState(false);
	const { register, handleSubmit, watch, errors } = useForm();
	const [userToken, setUserToken] = useState(null);

	const handleClose = () => {
        setOpenDialog(false);
    }

	const handleOpen = () => {
        setOpenDialog(true);
    }

	const onSubmit = async (data) => {
        await axios.post('api/v1/authentication/authenticate/', data).then((response) => {
			if (response.status == 200) {
				setUserToken(response.data.auth_token);
				setOpenDialog(false);
			}
        })
    };

	const renderDialog = () => {
        return (
            <Dialog onClose={handleClose} aria-labelledby="customized-dialog-title" open={openDialog}>
                <DialogTitle id="customized-dialog-title" onClose={handleClose}>
                   	Login
                </DialogTitle>
                <DialogContent dividers>
                    <form onSubmit={handleSubmit(onSubmit)}>
						<Container component="main" maxWidth="xs">
							<TextField 
								required 
								name="email" 
								label="Email Address" 
								fullWidth 
								autoComplete="email" 
								variant="outlined"
								margin="normal"
								autoFocus
								inputRef={register({ required: true })}
							/>
							<TextField 
								required 
								name="password" 
								label="Password" 
								type="password"
								fullWidth 
								autoComplete="current-password" 
								variant="outlined"
								margin="normal"
								inputRef={register({ required: true })}
							/>
							<Button
								type="submit"
								fullWidth
								variant="contained"
								color="primary"
								className={classes.submit}
							>
								Sign In
							</Button>
						</Container>
                    </form>
                </DialogContent>
            </Dialog>
        );
    }

	return (
		<React.Fragment>
			{renderDialog()}
			<CssBaseline />
			<AppBar position="relative">
				<Toolbar>
					<Typography className={classes.title} variant="h6" color="inherit" noWrap>
						ruby on rails 20200810
          			</Typography>
					<Button color="inherit" onClick={() => handleOpen()}>Login</Button>
				</Toolbar>
			</AppBar>
			<main>
				<div className={classes.heroContent}>
					<Container maxWidth="md">
						<Form userToken={userToken} />
					</Container>
				</div>
			</main>
			<footer className={classes.footer}>
				<Typography variant="h6" align="center" gutterBottom>
					ruby on rails 20200810
        		</Typography>
				<Typography variant="subtitle1" align="center" color="textSecondary" component="p">
					Something here to give the footer a purpose!
        		</Typography>
				<Copyright />
			</footer>
		</React.Fragment>
	);
}