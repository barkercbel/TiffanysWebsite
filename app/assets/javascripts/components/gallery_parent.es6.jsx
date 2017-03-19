class GalleryParent extends React.Component {
  
  constructor(){
  	super();
  	this.toggleExpand = this.toggleExpand.bind(this);
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
	
  render() {
  	
  	
	var primary = "#008B8B";
	var offWhite = "#CDC9C9";
  	
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
  	
  	
    return (
    	<div style={galleryContainerSpacing} >
	    	<div style={galleryContainerColor} >
				<GalleryItem title={this.props.title} image_url={this.props.image_url} description={this.state.desc} id={this.props.id} />
				<div style={galleryExpand} onClick={this.toggleExpand}></div>
			</div>
		</div>
    );
  }
}

