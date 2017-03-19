class GalleryItem extends React.Component {
	render(){
		
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
		    color: darkOffWhite
		};
		
		var galleryDescCollapse = {
		    margin: "45px 15px 5px 15px",
		    borderBottom: "1px solid" + darkOffWhite
		};
		
		var galleryImage = {
		    width: "80%",
		    display: "block",
		    margin: "30px auto 0px auto"
		};
		
		var galleryTitle = {
		    color: darkAccent,
		    fontFamily: "gill-sans",
		    fontSize: "24px"
		};
		
		var link = "/galleries/" + this.props.id;
		
		var descriptionBlock;
		
		if(this.props.description.length > 60){
			descriptionBlock = <div style={galleryDescContainer} ><p style={galleryDesc} >{this.props.description.substring(0, 58)}...</p></div>;
		}
		else if (this.props.description != ""){
			descriptionBlock = <div style={galleryDescContainer} ><p style={galleryDesc} >{this.props.description}</p></div>;
		}
		else{
			descriptionBlock = <div style={galleryDescCollapse} ></div>;
		}
		
		return(
			<div>
				
				<a href={link} ><img src={this.props.image_url} style={galleryImage} /> </a>
				<h1 style={galleryTitle}>{this.props.title}</h1>
				{descriptionBlock}
			</div>
		);
	}
} 

