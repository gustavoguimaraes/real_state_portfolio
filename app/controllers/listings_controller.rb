class ListingsController < ApplicationController

  def sales
    @houses = Listing.houses
    @condos_and_coops = Listing.condos_and_coops
  end

  def rentals
    @rentals = Listing.rentals
  end

  def show
    @listing = Listing.find_by(code: params[:code], publish: true)
    @agent = User.find_by(id: @listing.user_id) if @listing
    return not_found unless @listing

    if @listing.rental?
      render '_rentalshow.html.erb'
    elsif @listing.sale?
      render '_saleshow.html.erb'
    end
  end

  private

  def not_found
    render '_unavailable.html.erb'
  end

  def listing_params
    params.require(:listing).permit(:listing_type, :status, :publish, :headline, :sub_headline, :description, :listing_page_headline, :listing_page_description, :price)
  end

end