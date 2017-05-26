class GalleryParent extends React.Component {
  
  constructor(){
  	super();
  	this.toggleExpand = this.toggleExpand.bind(this);
  	this.addToCart = this.addToCart.bind(this);
  	this.notLoggedInDisplay = this.notLoggedInDisplay.bind(this)
  	this.state = {desc: ""};
  };
  
  toggleExpand(){
	if(this.state.desc == ""){
		this.setState({desc: this.props.description});
	}
	else{
		this.setState({desc: ""});
	}
  };
  
  notLoggedInDisplay(){
  	alert("Please log in to add items to your cart");
  };
  
  addToCart(){
  	cart.addItem(this.props.id);
  }
	
  render() {
  	
  	
	var primary = "#008B8B";
	var offWhite = "#CDC9C9";
	var secondaryAccent = "#F08080";
	var darkAccent = "#5E2605";
	var darkOffWhite = "#888888";
		
	var galleryDescContainer = {
		margin: "15px 5px 0px 15px",
		padding: "0px 0px 0px 0px",
		background: "white",
		borderRadius: "0px 0px 40px 0px",
		borderRight: "1px solid" + secondaryAccent
	};
		
	var galleryDesc = {
		color: darkOffWhite,
		display: "inline-block",
		margin: "10px 0px"
	};
		
	var galleryDescCollapse = {
		margin: "45px 15px 5px 15px",
		height: "0px",
		borderBottom: "1px solid" + darkOffWhite
	};
		
	var galleryImage = {
		width: "80%",
		display: "block",
	    margin: "30px auto 0px auto"
	};
		
	var galleryTitle = {
	    color: primary,
	    marginTop: "20px",
	    fontFamily: "'Book Antiqua', gill-sans",
	    fontSize: "18px"
	};
  	
  	var galleryContainerColor = {
  		background: "white",
  		textAlign: "center",
  		padding: "2px 10px 5px 10px",
  		borderRadius: "0px 0px 40px 0px",
  		borderRight: "2px solid" + primary,
  		position: "absolute",
		width: "100%"
  		
  	};
  	
  	var galleryExpand = {
	  	width: "35px",
	    height: "8px",
	    display: "block",
	    margin: "15px auto 2px auto",
	    borderTop: "1px solid black",
	    borderBottom: "1px solid black",
	    cursor: "pointer"
  	};
  	
  	var galleryContainerSpacing = {
  		height: "500px",
  		width: "100%",
  		display: "inline-block",
  		position: "relative"
  	};
  	
  	var cartIcon = {
  		height: "14px",
  		float: "left",
  		marginLeft: "10px"
  	};
  	
  	var addToCartContainer = {
  		width: "90%",
  		marginLeft: "5%",
  		overflow: "auto",
  		borderBottom: "1px solid black",
  		padding: "23px 0px 8px 0px",
  		cursor: "pointer"
  	};

  	var cartSpan = {
  		float: "left",
  		marginLeft: "5px",
  		fontSize: "10px"
  	};
  	
  	var descriptionBlock;
  	
	if(this.state.desc.length > 60){
		descriptionBlock = (<div style={galleryDescContainer} >
								<span style={galleryDesc} >{this.state.desc.substring(0, 58)}...</span>
							</div>);	
	}
	else if (this.state.desc){
		descriptionBlock = (<div style={galleryDescContainer} >
								<span style={galleryDesc} >{this.state.desc}</span>
							</div>);
	}
	else{
		descriptionBlock = <span></span>;
	}
		
  	var link = "/galleries/" + this.props.id;
  	var cartBlock;
  	if(this.props.loggedOut.toString() == "false"){
  		cartBlock = (<div style={addToCartContainer} onClick={this.addToCart}>
						<img style={cartIcon} src='/assets/Cart-icon-e4f76a3c6e264af8f4deb2c3b01e903c1770207839dbae7b5d3cf07877228eb8.png' />
						<span style={cartSpan}>| Add To Cart |</span>
						<span style={cartSpan}>{Number(this.props.price).toFixed(2)}</span>
					</div>);
  	}
  	else{
  		cartBlock = (<div style={addToCartContainer} onClick={this.notLoggedInDisplay}>
						<img style={cartIcon} src='/assets/Cart-icon-e4f76a3c6e264af8f4deb2c3b01e903c1770207839dbae7b5d3cf07877228eb8.png' />
						<span style={cartSpan}>| Add To Cart |</span>
						<span style={cartSpan}>{Number(this.props.price).toFixed(2)}</span>
					</div>);
  	}
  	return (
    	<div style={galleryContainerSpacing} >
	    	<div style={galleryContainerColor} >
				<div>
					<a href={link} ><img src={this.props.image_url} style={galleryImage} /> </a>
					<h1 style={galleryTitle}>{this.props.title}</h1>
					{cartBlock}
					{descriptionBlock}
				</div>
			<div style={galleryExpand} onClick={this.toggleExpand}></div>
			</div>
		</div>
    );
  }
}

