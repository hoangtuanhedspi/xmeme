class CardsController < BaseNavigationController
    def index
        @cards = @current_user.cards
    end

    def create
        @card = Card.new card_layout_id: params[:layout_id], user_id: params[:uid]
        return unless @card.save
    end

    def edit
        @card = Card.find_by id: params[:id]
        @layout = @card.card_layout
        @layouts = CardLayout.all
    end

    def update
        @card = Card.find_by id: params[:id]
        if @card.present?
            @card.update_attributes format: params[:format], thumb: params[:thumb]
        end
    end

    def destroy
        @card = Card.find_by id: params[:id]
        if @card.present?
            @card.destroy
            redirect_to cards_path
        end
    end
end
